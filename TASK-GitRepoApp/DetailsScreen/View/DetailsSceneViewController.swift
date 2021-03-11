
import UIKit
import SnapKit
import WebKit

class DetailsSceneViewController: UIViewController {
    
    var viewModel: DetailsSceneViewModel
    let webView: WKWebView = {
        let view = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        return view
    }()
    
    init(viewModel: DetailsSceneViewModel) {
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
        viewModel.showWebPage()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
}

extension DetailsSceneViewController {
    func setupNavigationBar() {
        navigationItem.title = viewModel.screenData.title
    }
    func setupViews() {
        viewModel.viewControllerDelegate = self
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view.addSubview(webView)
    }
}

extension DetailsSceneViewController: WKUIDelegate { }

extension DetailsSceneViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showAlert(text: "Couldn't access server to get data.") { [unowned self] in
            self.showSpinner()
            self.showInfoText(text: "Please connect to internet\n and try search again.")
        }
    }
}

extension DetailsSceneViewController {
    //MARK: CONSTRAINTS BELOW
    func setConstraintsWebView() {
        webView.snp.makeConstraints { (make) in make.edges.equalTo(view.safeAreaLayoutGuide) }
    }
}
