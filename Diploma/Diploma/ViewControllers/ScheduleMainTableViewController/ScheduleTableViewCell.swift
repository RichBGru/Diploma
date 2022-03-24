//
//  ScheduleTableViewCell.swift
//  Diploma
//
//  Created by Ткачук Артем Сергеевич on 23.03.2022.
//

import Foundation
import UIKit
import SnapKit

struct ScheduleTableViewCellViewModel {
    let subjectName: String
    let teacherName: String
    let subjectType: String
    let cabinetNumber: String
}

class ScheduleTableViewCell: UIView {
    private var substrateView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 58 / 255, green: 99 / 255, blue: 198 / 255, alpha: 0.3)
        view.layer.cornerRadius = 16
        
        return view
    }()
    private let subjectNameLabel = UILabel()
    private let teacherNameLabel = UILabel()
    private let subjectTypeLabel = UILabel()
    private let cabinetNumberLabel = UILabel()
    
    // MARK: - Init

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        addSubview(substrateView)
        [subjectNameLabel, teacherNameLabel,
         subjectTypeLabel, cabinetNumberLabel].forEach {
            self.substrateView.addSubview($0)
        }
        
        substrateView.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
        }

        subjectNameLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(16)
            make.trailing.equalTo(-16)
        }
        
        teacherNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(subjectNameLabel.snp.bottom).inset(-16)
            make.bottom.equalTo(-16)
        }

        backgroundColor = .white
    }
}

extension ScheduleTableViewCell: ViewModelSettable {
    public func setup(with viewModel: ScheduleTableViewCellViewModel) {
        subjectNameLabel.text = viewModel.subjectName
        teacherNameLabel.text = viewModel.teacherName
        subjectTypeLabel.text = viewModel.subjectType
        cabinetNumberLabel.text = viewModel.cabinetNumber
    }
}
