//
//  GamesTableViewController.swift
//  TestSearch
//
//  Created by Mario Azevedo on 03/02/2020.
//  Copyright © 2020 AppWeleuc Inc. All rights reserved.
//

import UIKit
import SDWebImage
import SafariServices

enum selectedScope: Int {
    case All = 0
    case appstore = 1
    case socialmedia = 2
    case jailbreak = 3
    case games = 4
    
    
}



class GamesTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    
    var urlsList : [NSURL] = [NSURL(string: "https://appweleux.com/")!,NSURL(string: "https://app-valley.vip/")!,NSURL(string: "https://facebook.com/")!]
    
    
    var URLIcons = [String]()
    
    var URLSigned = [String]()
    
    var URLScreen1 = [String]()
    
    var URLScreen2 = [String]()
    
    var URLScreen3 = [String]()
    
    
    
    

    let initialDataAry:[GamesModel] = ModelFactory.create()
    var dataAry:[GamesModel] = ModelFactory.create()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.searchBarSetup()
        
        self.tableView.reloadData()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
               
        self.navigationController?.navigationBar.tintColor = UIColor.white
               
        UIView.animate(withDuration: 0.1, animations: {
        self.navigationController?.navigationBar.alpha = 1
            }, completion: nil)
        
         scrollViewDidScroll()
        
        
//
//        URLIcons = ["https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Icons/pubg","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Icons/call-of-duty","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Icons/8ballpool"]
//
//
//        URLSigned = ["https://api.appweleux.com/AppWeleux/App/Sections/Signed","https://api.appweleux.com/AppWeleux/App/Sections/Signed","https://api.appweleux.com/AppWeleux/App/Sections/Signed"]
//
//
//        URLScreen1 = ["https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/pubg1","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/call-of-duty1","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/8-ball-pool1"]
//
//        URLScreen2 = ["https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/pubg2","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/call-of-duty2","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/8-ball-pool2"]
//
//        URLScreen3 = ["https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/pubg3","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/call-of-duty3","https://content.appweleux.com/AppWeleux/Sections/Games-Hacked/Screenshots/8-ball-pool3"]
//
//
//
        
        
    }
    
    func scrollViewDidScroll() {
         
         let scrollView = UIScrollView()
         var offset = scrollView.contentOffset.y / 150
         if offset > 1{
             offset = 1
             
             self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
             self.navigationController?.navigationBar.shadowImage = UIImage()
             self.navigationController?.navigationBar.tintColor = UIColor.blue
             
             
         } else {
             
             
             self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
             self.navigationController?.navigationBar.shadowImage = UIImage()
             
             self.navigationController?.navigationBar.tintColor = UIColor.blue
             
             
             
             
         }
         
    }

    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = false
        searchBar.placeholder = "Search any app "
        searchBar.scopeButtonTitles = ["All","AppStore","Social Media ","Jailbreak ","Games"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.white
        searchBar.tintColor = UIColor.black
        searchBar.backgroundColor = UIColor.white
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.tableView.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataAry = initialDataAry
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
        
        self.tableView.reloadData()
    }
    
    func filterTableView(ind:Int,text:String) {
        switch ind {
        
        case selectedScope.All.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.nameLL.lowercased().contains(text.lowercased())
            })
            
        case selectedScope.appstore.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.sectionLL.lowercased().contains(text.lowercased())
          })

        case selectedScope.socialmedia.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.sectionLL.lowercased().contains(text.lowercased())
            })

        case selectedScope.jailbreak.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.sectionLL.lowercased().contains(text.lowercased())
            })

        case selectedScope.games.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.sectionLL.lowercased().contains(text.lowercased())
            })
       
        default:
            print("no type")
        }
    }
    
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
        let model = dataAry[indexPath.row]
        
      //  cell.nameLbl.text = model.imageName
        
      //  cell.imgView.image = UIImage(named: model.imageName)
        
        print("INDEX PATH: \(indexPath.row)")
       
        cell.imgView?.sd_setImage(with: URL(string: model.icon))
        cell.imgView.layer.cornerRadius = view.frame.height / 2
        cell.imgView.clipsToBounds = true
        cell.imgView.layer.cornerRadius = 10.0
        
        cell.ImgSigned?.sd_setImage(with: URL(string: model.signedImage))
        
        cell.screen1?.sd_setImage(with: URL(string: model.imageURls[0]))
        cell.screen1.clipsToBounds = true
        cell.screen1.layer.cornerRadius = 6.0
        cell.screen1.contentMode = .scaleAspectFill
        
        cell.screen2?.sd_setImage(with: URL(string: model.imageURls[1]))
        cell.screen2.clipsToBounds = true
        cell.screen2.layer.cornerRadius = 6.0
        cell.screen2.contentMode = .scaleAspectFill
        
        cell.screen3?.sd_setImage(with: URL(string: model.imageURls[2]))
        cell.screen3.clipsToBounds = true
        cell.screen3.layer.cornerRadius = 6.0
        cell.screen3.contentMode = .scaleAspectFill
        
        cell.nameApp.text = model.nameLL
        cell.section.text = model.sectionLL
        
        cell.GetLabel.tag = indexPath.row
        cell.GetLabel.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
        
        
        
        
        
        
        
        
        return cell
    }
    
    
    @objc
    func rowButtonWasTapped(sender:UIButton){
        
         UIApplication.shared.open(URL(string: "\(self.urlsList[sender.tag])")! as URL, options: [:], completionHandler: nil)
        
       
    }

           
}



 

