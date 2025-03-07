////
////  ListViewController.swift
////  TravelVista
////
////  Created by Amandine Cousin on 13/12/2023.
////
//
//import UIKit
//
//class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    @IBOutlet weak var tableview: UITableView!
//    
//    var regions: [Region] = Service().load("Source.json")
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.title = "Liste de voyages"
//        self.tableview.dataSource = self
//        self.tableview.delegate = self
//    }
//    
//    // Gestion des sections - 2 fonctions
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return regions.count
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return regions[section].name
//    }
//    
//    // Gestion des cellules - 3 fonctions
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return regions[section].countries.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
//        cell.setUpCell(country: regions[indexPath.section].countries[indexPath.row])
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 65
//    }
//
//    
//    // Fonction appelée lorsqu'une cellule est cliquée
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let senderCell = sender as? CustomCell,
//           let country = senderCell.country,
//           let controller: DetailViewController = segue.destination as? DetailViewController {
//            controller.country = country
//            
//        }
//    }
//}
//
