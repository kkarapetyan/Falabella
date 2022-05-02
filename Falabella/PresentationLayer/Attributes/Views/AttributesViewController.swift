//
//  AttributesViewController.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import UIKit

class AttributesViewController: BaseViewController  {
    
    @IBOutlet weak var mTableV: UITableView!
    @IBOutlet weak var mSearchTxtFl: UITextField!
    
    lazy var presenter = AttributesPresenter(delegate: self)
    private var valutas = [Valuta]()
    private var filteredData = [Valuta]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.getUsernameTitle()
        configureUI()
        configureTableView()
        presenter.getAttributes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    ///Configure UI
    func configureUI() {
        navigationController?.setNavigationBarBackground(color: Constant.Colors.main_color)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: Constant.Strings.logout, style: .plain, target: self, action: #selector(logoutTapped))

    }
    
    ///Configure table view
    func configureTableView() {
        //view.addSubview(tableView)
        mTableV.separatorColor = .clear
        mTableV.register(AttributeTableViewCell.nib(), forCellReuseIdentifier: AttributeTableViewCell.identifier)
        mTableV.delegate = self
        mTableV.dataSource = self
    }
    
    @objc func logoutTapped(sender: UIBarButtonItem) {
        presenter.didTapLogout()
    }
    
}


//MARK -- UITableViewDelegate & UITableViewDataSource
extension AttributesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return valutas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AttributeTableViewCell.identifier, for: indexPath) as! AttributeTableViewCell
        cell.setCellInfo(item: valutas[indexPath.row])
        
        return cell
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapTableCell(valuta: valutas[indexPath.row])
    }
    
}


//MARK: -- UITextField Delegate
extension AttributesViewController: UITextFieldDelegate {


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return false }
        
        let fullString = NSString(string: text).replacingCharacters(in: range, with: string)
        presenter.searchAttributes(searchTxt: fullString)

        return true
    }
}



//MARK: -- Attributes Presenter Delegate
extension AttributesViewController: AttributesPresenterDelegate {
    
    ///Show  Login view
    func showLogin() {
        let vc = LoginViewController(nibName: Constant.NibNames.login, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
    ///Present  attributes on table view
    func presentAttributes(valutas: [Valuta]) {
        self.valutas = valutas
        DispatchQueue.main.async {
            self.mTableV.reloadData()
        }
    }
    
    
    ///Will show details view controller
    func presentDetails(valuta: Valuta) {
        let detailsVC = DetailsViewController(nibName: Constant.NibNames.details, bundle: nil)
        detailsVC.presenter.receiveDetails(valuta: valuta)
        
        self.navigationController?.pushViewController(detailsVC, animated: true)

    }
    
    
}
