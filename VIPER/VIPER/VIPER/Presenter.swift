//
//  Presenter.swift
//  VIPER
//
//  Created by Rajesh Billakanti on 27/11/21.
//

// Object
// Protocol
// Has ref to View, Interactor, router
import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var view: AnyView? { get set }
    var interactor: AnyInteractor? { get set }
    var router: AnyRouter? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var router: AnyRouter?
    
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something wnt wrong")
        }
    }
}


