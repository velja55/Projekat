   M S B A M L   `   `   `  ����I  ENetworkService, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:NetworkServiceNetworkService  5   	   C&clr-namespace:NetworkService.ViewModelNetworkService.ViewModel  5   	   ;"clr-namespace:NetworkService.ViewsNetworkService.Views  5	   	   W SNotification.Wpf, Version=8.0.0.0, Culture=neutral, PublicKeyToken=1acac493089262b5_Aclr-namespace:Notification.Wpf.Controls;assembly=Notification.WpfNotification.Wpf.Controls 5
   ;       NetworkService.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:NetworkService     5   	   <	viewModel&clr-namespace:NetworkService.ViewModel     5   	   4views"clr-namespace:NetworkService.Views     5	   	   X TFontAwesome5.Net, Version=2.1.11.0, Culture=neutral, PublicKeyToken=9cfaf01297a008f8/fa5%http://schemas.fontawesome.com/icons/  5
   	   UnotificationsAclr-namespace:Notification.Wpf.Controls;assembly=Notification.Wpf  6;     � 
ResizeMode$  NoResize=�5   	    � Title$ 
MainWindow��5   	   $	��600��6   $
��1000��6)      	BlueBrush#��[  5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � DataContext 5      2   ,NetworkService.ViewModel.MainWindowViewModel  5   
    � 	Resources 5       �� DataType,   &NetworkService.ViewModel.HomeViewModel#   NetworkService.Views.HomeView-   'NetworkService.ViewModel.TableViewModel$   NetworkService.Views.TableView,   &NetworkService.ViewModel.GridViewModel#   NetworkService.Views.GridView-   'NetworkService.ViewModel.GraphViewModel$	   NetworkService.Views.GraphView��%,  (��       5      *, +)(�� 2     5      *, +)(�� d     5      *, +)(�� �     5#      *, +)�� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5         5!      �� 5#   
   "  6   .R�5$      	  5%      5&       J� InputBindings 5(      �� 5)   
    �� CommandParameter$
 home��64   
	 �� Key$	 D1��6L   
 �� 	Modifiers$
 Controlf�6U    �� Command 6   �� *
NavCommand+6U   �� 5*   
   $ table��64   $	 D2��6M   $
 Controlf�6V    6   �� *
NavCommand+6V   �� 5+   
   $
 grid��64   $	 D3��6L   $
 Controlf�6U    6   �� *
NavCommand+6U   �� 5,   
   $ graph��64   $	 D4��6M   $
 Controlf�6V    6   �� *
NavCommand+6V   �� 5-   
   $	 H��67   $
 Controlf�6?    6   �� *ToggleCommand+6?   �� 5.   
   $		 Esc��65    6   �� *ExitCommand+65   .��54      �  � ColumnDefinitions 58   
   �� 59      $��* �6   �� 5:      $��6* �6   .+�5=   
   0
  *Notification.Wpf.Controls.NotificationArea
  -   5         
 Name$  MainWindowNotificationArea��5>       K� ZIndex$
 1000��5?       
  MaxItems$ 3��5@       
  Position$ TopLeft=�5A      $��1��5B      $	��400��5C      $	��200��5D      $	��Top=�5E      $
��Left=�5F      � 5H   
   $��0��6     DarkBlueBrush#��[ 6   $��2��6K    � RowDefinitions 5I      �� 5J      �� 5K      �� 5L      �� 5M      �� 5N       5P      �� 5Q      $��5* �6#   60   �� 5R      $��* �6#   6/   .+�5U      �� -   5        $��
HomeButton��5U   !   $��10q�6    � Cursor$
 Hand��63     LightBlueBrush#��[ 6`   $
��home��6�    � ToolTip$ Go to home page��6�   ��6A   �� *
NavCommand+ ^� 	IsEnabled 5V      �� *ToolTipVisibility+.��5W      ��  �� Orientation$ Vertical=�6   .+�5X        FontAwesome5.FontAwesome     Icon$ 
Solid_Home=�6&   $��25(�68   �� 5Y      $
��Home��6    $��15(�6,   $
��Bold"�6:   5Z      5[      �� 5]      $��1��6   $��10q�6C   ��6(   �� *	Colors[0]+6R   �� 5^      $��1��6   $��1��6(   $��10q�6P   ��65   �� *	Colors[1]+6_   �� 5_      $��1��6   $��2��6(   $��10q�6P   ��65   �� *	Colors[2]+6_   �� 5`      $��1��6   $��3��6(   $��10q�6P   ��65   �� *	Colors[3]+6_   �� 5b      -   5        $��TableButton��5b   !   $��10q�6   $��1��64   $
 Hand��6A   #��[ 6n   $��table��6�   $ Go to trable page��6�   ��6O   �� *
NavCommand+ 6�   �� *ToolTipVisibility+.��5c      �� $ Vertical=�6   .+�5d        $ Solid_Table=�6&   $��25(�69   �� 5e      $��Table��6    $��15(�6-   $
��Bold"�6;   5f      5g      �� 5i      -   5        $��
GridButton��5i   !   $��10q�6   $��2��63   $
 Hand��6@   #��[ 6m   $
��grid��6�   $ Go to grid page��6�   ��6N   �� *
NavCommand+ 6�   �� *ToolTipVisibility+.��5j      �� $ Vertical=�6   .+�5k        $ Solid_Th=�6&   $��25(�66   �� 5l      $
��Grid��6    $��15(�6,   $
��Bold"�6:   5m      5n      �� 5o      -   5        $��GraphButton��5o   !   $��10q�6   $��3��64   $
 Hand��6A   #��[ 6n   $��graph��6�   $ Go to graphic page��6�   ��6O   �� *
NavCommand+ 6�   �� *ToolTipVisibility+.��5p      �� $ Vertical=�6   .+�5q        $ Solid_ChartPie=�6&   $��25(�6<   �� 5r      $��Graphic��6    $��15(�6/   $
��Bold"�6=   5s      5t      �� 5u      -   5        $��
HelpButton��5u   !   $��10q�6   $��4��63   $
 Hand��6@   $ Exit from app��6N   #��[ 6�    6f   �� *ToolTipVisibility+��6�   �� *ExitCommand+.��5v      �� $ Vertical=�6   .+�5w        $ Solid_PowerOff=�6&   $��30(�6<   �� 5x      $
��Exit��6    $��15(�6,   $
��Bold"�6:   5y      5z      5{      � 5|   
   $��1��6    5}      �� 5~      $��3* �6#   �� 5      $��* �6#    5�      �� 5�      $��* �6    �� 5�      $��8* �6    .+�5�      �� $��1��6   $��0��6)   $ 
Horizontal=�66   $��Center=�6O   $��Center=�6j   .+�5�      �� $
��Help��6   $��20(�6(   
�������$
��Bold"�6I   $��	10,10,0,0q�6[   $��Center=�6n   d� 5�      $
 Hand��6     ToggleButtonStyle1#��[ 6-   
�������#��[ 6l   $��15(�6�   $
��Bold"�6�   $��5,12,0,0q�6�   $��Center=�6�    d� 	IsChecked 6�   �� *	IsToggled+6�   5�      �� 5�      $��0��6   $��1��6%   $��8,3,8,7q�6[   #��[ 6l   $��1q�6�   ��62   �� *ColspanFrame+._�5�      �� -   5         ��Name$ ContentControl��5�      ��67   �� *CurrentViewModel+5�      �� 5�      $��0��63   $��Center=�6A   $��Center=�6^   $��40(�6y   $��Black"�6�   
���������6   �� *Title+6�   �� 5�      
�������$ Vertical=�6,   $��1��6C   $��1��6S   $��7q�6`   ��6k   �� *	HelpWidth+.+�5�      �� $
��Help��6   $��Center=�6(   $��20(�6E   $
��Bold"�6T   #��[ 6f   6�   �� 5�      #��[ 62   $��13(�6^   $��5q�6l   ��6   �� *Help+6l   5�      5�      5�      5�      