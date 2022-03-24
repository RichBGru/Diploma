//
//  ViewModelSettable.swift
//  Diploma
//
//  Created by Ткачук Артем Сергеевич on 23.03.2022.
//

import Foundation

public protocol ViewModelSettable: AnyObject {
    associatedtype ViewModel
    func setup(with viewModel: ViewModel)
    func prepareForReuse()
}

public extension ViewModelSettable {
    func prepareForReuse() {}
}
