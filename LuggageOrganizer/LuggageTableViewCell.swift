//
//  LuggageTableViewCell
//  LuggageOrganizer
//
//  Created by Brandon Cornel on 9/25/17.
//  Copyright © 2017 Brandon Cornel. All rights reserved.
//

import UIKit

class LuggageTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var luggageNameLabel: UILabel!
    @IBOutlet weak var luggageDescriptionTextView: UITextView!
    @IBOutlet weak var luggagePhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
