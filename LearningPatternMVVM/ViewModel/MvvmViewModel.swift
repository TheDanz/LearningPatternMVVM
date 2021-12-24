//
//  MvvmViewModel.swift
//  LearningPatternMVVM
//
//  Created by Danil Ryumin on 25.12.2021.
//

import Foundation

protocol MvvmViewModelProtocol {
    var updateView: ((MvvmModel)->())? { get set }
    
    func showFirstImage()
    func showSecondImage()
    func showDefaultImage()
}

class MvvmViewModel: MvvmViewModelProtocol {
    var updateView: ((MvvmModel) -> ())?
    
    func showFirstImage() {
        updateView?(.loading(MvvmModel.Model(image: "Loading", isHidden: false)))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.updateView?(.success(MvvmModel.Model(image: "Success", isHidden: true)))
            }
    }
    
    func showSecondImage() {
        updateView?(.loading(MvvmModel.Model(image: "Loading", isHidden: false)))
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
             self.updateView?(.failure(MvvmModel.Model(image: "Failure", isHidden: true)))
           }
    }
    
    func showDefaultImage() {
        updateView?(.initial(MvvmModel.Model(image: "Default", isHidden: true)))
    }
}
