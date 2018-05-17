//
//  NetClient.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/24.
//  Copyright © 2018年 李阳. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

public enum NetError : Swift.Error {
    case HTTP(NSError)
    case Data
}

enum FileType:String {
    case image = "图片"
    case voice = "语音"
}
//上传图片
class UploadFile {
    var type:FileType = FileType.image;
    //这里不明白为啥要加  @objc
    @objc var names:[String] = []
    @objc var files :[AnyObject] = []
    @objc var fileNames:[String] = []
    @objc var voicePaths:[String] = []
    
}

//viewmodel遵守的协议
protocol Request {
    var url : URL { get }
    var path : String {get set}
    var baseURLtring : String {get set}
    var method : HTTPMethod {get set}
    var parameters :[String:Any]? {get set}
}
protocol ViewModelType {
    //关联类型，具体类型需要在具体调用的时候才能确定
    associatedtype Input
    associatedtype Output
    //协议方法，这里的Input 和Output  输入输出暂未确定类型，先使用关联类型代替
    func transfrom(input:Input) -> Output
}
//创建
struct Netclient {
    
    //这里不明白为啥这么写
    private static func handleResponse(result:Result<Any>,observer:RxSwift.AnyObserver<[String:Any]>){
        switch result {
        case .success(let value):
            AppSettings.httpSetCookies();
            if let json = value as? [String:Any]{
                observer.onNext(json);
                observer.onCompleted();
            }else{
                observer.onError(NetError.Data);
            }
            
        case .failure(let error as NSError):
            observer.onError(NetError.HTTP(error));
       }
}
    //
    static func request<R:Request>(request:R) -> Observable<[String:Any]>{
        return Observable.create({ (observer) -> Disposable in
            //保存cooike
            AppSettings.httpSetCookies();
            
            Alamofire.request(request.url, method: request.method, parameters: request.parameters).responseJSON(completionHandler: { (response) -> Void in
                handleResponse(result: response.result, observer: observer)
            })
            return Disposables.create {};
        })
    }
    
    static func downloadFile<R:Request>(request:R,downloadPath:String) ->Observable<[String:Any]> {
        return Observable.create({ (observer) -> Disposable in
            //将downloadPath转化成URL格式
            let filePath = URL(fileURLWithPath: downloadPath);
            let destination : DownloadRequest.DownloadFileDestination = {_,_  in
                return (filePath,[.createIntermediateDirectories, .removePreviousFile])
            }
            
            Alamofire.download(request.url, method: request.method, parameters: request.parameters, to: destination)
                .downloadProgress(queue: DispatchQueue.global(qos:.utility), closure: { (progress) in
                    print("Progress:\(progress.fractionCompleted)")
                })     //这里temporaryURL destinationURL
                .validate{request,response,temporaryURL,destinationURL in
                    observer.onNext([ : ]);
                    observer.onCompleted();
                    return  .success;
            }
                .responseJSON(completionHandler: { (response) in
                    debugPrint(response.debugDescription)
                    print(response.temporaryURL)
                    print(response.destinationURL)
                })
                 
            
            return Disposables.create {
            }
        })
    }
    
    static func configHeaders() -> HTTPHeaders {
        var headers:HTTPHeaders = ["Content-type":"application/json;charset:utf-8",
            "systemtype":"ios",
            "channel":"00",
            "Authorization":""
          ]
        return headers;
        
    }
    
    //上传文件
    static func uploadFile<R:Request>(request:R,Files:[UploadFile],scale:CGFloat = 1.0) -> Observable<[String:Any]> {
        return Observable.create({ (observer) -> Disposable in

            Alamofire.upload(
                multipartFormData: { multipartFormDta in
                  //这里很奇怪  for 遍历到底要不要写类型
                    for uploadFile:UploadFile in Files {
                        //switch问题，如果到底是否需要些break
                        switch uploadFile.type {
                        case .image:
                            var names = uploadFile.names
                            let files = uploadFile.files
                            var fileNames = uploadFile.fileNames
                            if let images = files as? [UIImage] {
                                images.enumerated().forEach({ (index,image) in
                                    let data = UIImageJPEGRepresentation(image, scale)
                                    multipartFormDta.append(data!, withName: names[index], fileName: fileNames[index], mimeType: "image/*")
                                })
                            }
                            break
                            
                        case .voice: break
                        var names = uploadFile.names
                        let voicePaths = uploadFile.voicePaths
                        var fileNames = uploadFile.fileNames
                        let fm = FileManager.default
                        voicePaths.enumerated().forEach({ (index,voicePath) in
                            if fm.isExecutableFile(atPath: voicePaths[index]){
                                let url = URL(fileURLWithPath: voicePath);
                                do {
                                    let data = try Data.init(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
                                    multipartFormDta.append(data, withName: names[index], fileName: fileNames[index], mimeType: "amr/mp3/wmr")
                                    
                                } catch {
                                    
                                }
                                
                            }
                        })
                        
                        }
                    }
                
                    guard let parameters = request.parameters else {
                        //确定参数，如果为空直接返回
                        return;
                    }
                    parameters.forEach({ (key,value) in
                        let data = (value as! String).data(using: String.Encoding.utf8);
                        multipartFormDta.append(data!, withName: key);
                    })
            }, to: request.url.absoluteString,
                 encodingCompletion: { encodingResult in
                   //注意这里switch 可以不写break但是每个case下必须要有至少一句代码
                    switch encodingResult {
                    case .success(let upload, _,_) :
                        upload.responseJSON(completionHandler: { (response) in
                            handleResponse(result: response.result, observer: observer)
                        })
                    case .failure(let encodingError):
                        print(encodingError);
                    }
             })
            return Disposables.create {
                //注意：这里不先写上这句回调的话，上面会报错Result value of type '()' does not conform to closure result type
            }
        })
    }
}
