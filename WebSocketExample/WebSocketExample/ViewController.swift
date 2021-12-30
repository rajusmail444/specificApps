//
//  ViewController.swift
//  WebSocketExample
//
//  Created by Rajesh Billakanti on 9/12/21.
//

import UIKit

class ViewController: UIViewController, URLSessionWebSocketDelegate {
    
    var webSocket: URLSessionWebSocketTask?
    
    var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(
            configuration: .default,
            delegate: self,
            delegateQueue: OperationQueue()
        )
        
        let url = URL(string: "wss://.....")!
        webSocket = session.webSocketTask(with: url)
        webSocket?.resume()
        
        closeButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        view.addSubview(closeButton)
        closeButton.center = view.center
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    
    func ping() {
        webSocket?.sendPing { error in
            if let error = error {
                print("error: \(error)")
            }
        }
    }
    
    @objc func close() {
        webSocket?.cancel(with: .goingAway,
                          reason: "Demo ended".data(using: .utf8))
    }
    
    func send() {
        DispatchQueue.global().asyncAfter(deadline: .now()+1) {
            self.send()
            self.webSocket?.send(.string("send new message: \(Int.random(in: 0...1000))")) { error in
                if let error = error {
                    print("error: \(error)")
                }
            }
        }
    }
    
    func receive() {
        webSocket?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .data(let data):
                    print("Got data: \(data)")
                case .string(let message):
                    print("Got string: \(message)")
                @unknown default:
                    break
                }
            case .failure(let error):
                print("Received error: \(error)")
            }
            self?.receive()
        }
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Did connect to socket")
        ping()
        receive()
        send()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Did close connection with reason")
    }
}

