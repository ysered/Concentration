
import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme",
            let button = sender as? UIButton,
            let viewController = segue.destination as? ConcentrationViewController {
            
            let theme: AppTheme
            switch button.tag {
            case AppTheme.animals.rawValue: theme = .animals
            case AppTheme.halloween.rawValue: theme = .halloween
            default:
                print("Couldn't find theme for identifier: \(button.tag)")
                theme = .animals
                break
            }
            viewController.appTheme = theme.getAppThemeAttributes()
        }
    }
}
