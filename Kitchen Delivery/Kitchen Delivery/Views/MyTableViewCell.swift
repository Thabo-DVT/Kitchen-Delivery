//
//  MyTableViewCell.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/19.
//



import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, imageName: String ){
        myLabel.text = title
        if let imageURL = URL(string:  imageName){
            myImageView.load(url: imageURL)
        }
        
    }
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
   
    
}



extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        print(image)
                        self?.image = image
                    }
                }
            }
        }
    }
}


//extension UIImageView{
//    func loadImage(imageloadUrl : String){
//
//        guard let urlForImage = URL(string: imageloadUrl) else{
//              return
//            }
//            let getDataTask = URLSession.shared.dataTask(with: urlForImage) { data, _, error in
//              guard let imageCaptured = data, error == nil else{
//                return
//              }
//              DispatchQueue.main.async {
//                let imageOfFood = UIImage(data: imageCaptured)
//                self.image = imageOfFood
//              }
//            }
//            getDataTask.resume()
//    }
//}
