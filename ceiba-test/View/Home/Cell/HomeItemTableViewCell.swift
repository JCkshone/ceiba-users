//
//  HomeItemTableViewCell.swift
//  ceiba-test
//
//  Created by Jc on 22/04/20.
//  Copyright © 2020 Jc. All rights reserved.
//

import UIKit
import MapKit

class HomeItemTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var profileView: Lottie!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var phoneLabel: UILabel!
    @IBOutlet fileprivate weak var emailLabel: UILabel!
    @IBOutlet weak var rootContentView: UIView!
    @IBOutlet weak var mapContentView: UIView!
    
    private var animation: Lottie = Lottie()
    private var mapView: MKMapView = MKMapView()
    
    var animationName: String = "" {
        didSet {
            profileView.setupAnimation(animationName)
        }
    }
    
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var phone: String = "" {
       didSet {
        phoneLabel.text = phone
       }
    }
    
    var email: String = "" {
       didSet {
        emailLabel.text = email
       }
    }
    
    func setMapView(geo: Geo) {
        let initialLocation = CLLocation(latitude: geo.lat, longitude: geo.lng)
        mapView.centerToLocation(initialLocation)
        mapView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 32, height: profileView.bounds.height)
        mapContentView.addSubview(mapView)
    }
    
    func setPin(geo: Geo) {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: geo.lat, longitude: geo.lng)
        pin.title = "Burj Khalifa"
        pin.subtitle = "The tallest buildiing in the world."
        mapView.addAnnotation(pin)
    }
    
    override func prepareForReuse() {
        emailLabel.text = ""
        phoneLabel.text = ""
        nameLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rootContentView.addShadow()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
