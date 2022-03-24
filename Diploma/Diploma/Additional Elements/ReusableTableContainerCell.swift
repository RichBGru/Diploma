//
//  ReusableTableContainerCell.swift
//  Diploma
//
//  Created by Ткачук Артем Сергеевич on 23.03.2022.
//

import Foundation
import UIKit

public final class ReusableTableContainerCell<View: ViewModelSettable & UIView>: UITableViewCell, ViewModelSettable {
    private let mainView = View(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .clear
        contentView.addSubviewWithConstraints(mainView)
    }

    public override func prepareForReuse() {
        super.prepareForReuse()
        mainView.prepareForReuse()
    }

    @discardableResult
    public override func becomeFirstResponder() -> Bool {
        return mainView.becomeFirstResponder()
    }

    public func setup(with viewModel: ReusableTableContainerViewModel<View>) {
        selectionStyle = viewModel.selectionStyle
        mainView.setup(with: viewModel.viewModel)
    }
}
