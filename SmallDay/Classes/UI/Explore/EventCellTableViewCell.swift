//
//  EventCellTableViewCell.swift
//  SmallDay
//
//  Created by MacBook on 15/8/23.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

import UIKit

class EventCellTableViewCell: UITableViewCell {

    var eventModel: EveryDay? {
        didSet {
            cellTileLabel.text = eventModel!.events?.last?.feeltitle
            titleLabel.text = eventModel!.events?.last?.title
            subTltleLabel.text = eventModel!.events?.last?.address
            dayLabel.text = eventModel?.day
            monthLabel.text = eventModel?.month
            if let imageURL = NSURL(string: eventModel!.events!.last!.imgs!.last!) {
                imageImageView.kf_setImageWithURL(imageURL, placeholderImage: UIImage(named: "quesheng"))
            }
            
        }
    }
    
    @IBOutlet weak var cellTileLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTltleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .None
    }
    
    class func eventCell(tableView: UITableView) -> EventCellTableViewCell {
        let identifier = "eventCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as? EventCellTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("EventCellTableViewCell", owner: nil, options: nil).last as? EventCellTableViewCell
        }
        
        return cell!
    }
    
}
