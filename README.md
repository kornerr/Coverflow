
# Overview

This is a sample iOS application with cover flow effect using UICollectionView layout from [schwa/Coverflow][schwa-Coverflow].

# Preview

This is what the app looks like:

![Preview][preview]

# Architecture overview

* AppDelegate
    * creates UIWindow
    * instantiates CoverFlowCoordinator
    * assigns UIWindow's rootVC to CoverFlowCoordinator's one
* CoverFlowCoordinator
    * instantiates CoverFlowSectionsView
    * embeds CoverFlowSectionsView into VC
* CoverFlowSectionsView
    * uses [schwa/Coverflow][schwa-Coverflow] to display UICollectionView cells as cover flow
    * uses CoverFlowSectionsViewItem for cell views
* CoverFlowSectionsViewItem
    * represents cell's view
    * only has UIImage so far
* SectionsItem
    * internal representation displayed by CoverFlowSectionsViewItem

[schwa/Coverflow][schwa-Coverflow] is located under `External/schwa-Coverflow`.

# Images

Images represent [Mass Effect races][me-races].

# What's missing

Paging by cell.

[preview]: preview.gif
[schwa-Coverflow]: https://github.com/schwa/Coverflow
[me-races]: http://masseffect.wikia.com/wiki/Races
