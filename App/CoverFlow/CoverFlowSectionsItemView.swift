
import UIKit

class CoverFlowSectionsItemView: UIView
{

    // MARK: - IMAGE

    var image: UIImage?
    {
        get
        {
            return self.imageView?.image
        }
        set
        {
            self.imageView?.image = newValue
        }
    }
    
    @IBOutlet private var imageView: UIImageView!
    
}

