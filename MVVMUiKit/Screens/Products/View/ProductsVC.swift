//
//  ProductsVC.swift
//  MVVMUiKit
//
//  Created by satheesh kumar on 11/06/23.
//

import UIKit

class ProductsVC: UIViewController {
    
    @IBOutlet weak var produtTblView: UITableView!
    private var vm = ProductVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        // Do any additional setup after loading the view.
    }

}
extension ProductsVC{
    func configuration(){
        produtTblView.register(UINib(nibName: "ProductTVCell", bundle: nil), forCellReuseIdentifier: "ProductTVCell")
        initViewModel()
        obserEvent()
    }
    func initViewModel(){
        vm.fetchProductList()
    }
    func obserEvent(){
        vm.eventHandler = {[weak self] event in
            guard let self else{
                return
            }
            switch event {
            case .loading:
                print("loading")
            case .stopLoading:
                print("stop loading")
            case .dataLoaded:
                print("data..",vm.products)
                DispatchQueue.main.async {
                    self.produtTblView.reloadData()
                }
                
            case .error(let error):
                print("error",error ?? "Something went wrong")
                
            }
        }
    }
}
extension ProductsVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVCell") as? ProductTVCell else {
            return UITableViewCell()
        }
       
        cell.product = vm.products[indexPath.row]
        return cell
    }
    
    
}
