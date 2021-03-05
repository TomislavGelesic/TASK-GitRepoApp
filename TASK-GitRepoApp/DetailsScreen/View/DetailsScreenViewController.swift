
import UIKit
import SnapKit
import WebKit

class DetailsScreenViewController: UIViewController {
    
    var viewModel: DetailsScreenViewModel
    let webView: WKWebView = {
        let view = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        return view
    }()
    
    init(viewModel: DetailsScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    deinit { print("DetailsScreenViewController deinit called.") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setConstraintsWebView()
        showWebPage()
    }
}

extension DetailsScreenViewController {
    func setupNavigationBar() {
        let backButton: UIBarButtonItem = {
            let buttonImage = UIImage(systemName: "arrow.left")
            let button = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(backTapped))
            button.tintColor = .black
            return button
        }()
        navigationController?.navigationBar.isHidden = false
        navigationItem.setLeftBarButton(backButton, animated: true)
        navigationController?.navigationBar.tintColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        navigationItem.title = viewModel.screenData.title
    }
    func setupViews() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view.addSubview(webView)
    }
    @objc func backTapped() { viewModel.backButtonTapped() }
    
    func showWebPage() {
        if let validURL = URL(string: viewModel.screenData.webPagePath),
           UIApplication.shared.canOpenURL(validURL) {
            webView.load(URLRequest(url: validURL))
        }
    }
}

extension DetailsScreenViewController: WKUIDelegate { }

extension DetailsScreenViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showAlert(text: "Couldn't access server to get data.") { [unowned self] in
            self.showSpinner()
            self.showInfoText(text: "Please connect to internet\n and try search again.")
        }
    }
}


extension DetailsScreenViewController {
    //MARK: CONSTRAINTS BELOW
    func setConstraintsWebView() {
        webView.snp.makeConstraints { (make) in make.edges.equalTo(view.safeAreaLayoutGuide) }
    }
}
