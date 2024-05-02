//
//  UniversitiesListTableViewCell.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import UIKit

class UniversitiesListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var identifier: String {
        return String.init(describing: self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }
    
    func setupCellWith(dataModel: UniversityUIModel?) {
        titleLabel.text = dataModel?.name
        stateLabel.text = dataModel?.state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = "- -"
        stateLabel.text = "- -"
    }
}
