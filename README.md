# simpleInteractiveKeyboardDismiss
interactive keyboardDismissMode using inputAccessoryView

1. set your scroll view (UITableView or UICollectionView) frame equal to you UIViewController frame
2. set `.interactive` to `keyboardDismissMode` of your scroll view
3. override `canBecomeFirstResponder` and return `true`
4. setup input container with UITextField or UITextView in screen bottom
5. override `inputAccessoryView` and return input container
6. enjoy
