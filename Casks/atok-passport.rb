class AtokPassport < Cask
  url 'http://www5.justsystem.co.jp/download/atok/ut/mac/at26try2.dmg'
  homepage 'https://www.justmyshop.com/products/atok_passport/'
  version '26'
  sha256 '31651de2f1546d7897ee902ac87d8ef2203d36bb85e08a35356e322f1fcd854c'
  install 'ATOK 2013 インストーラ.pkg'
  uninstall :script => '/Applications/JustSystems/ATOK 2013/ATOK Uninstaller.app/Contents/MacOS/ATOK Uninstaller'
end
