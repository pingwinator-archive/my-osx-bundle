class ClipStudioPaint < Cask
  url 'http://www.clip-studio.com/clip_site/download/clipstudiopaint/system/dl?f=lib/clipstudio/paint/data/133/CSP_133m_app.dmg'
  homepage 'http://www.clipstudio.net/'
  version '1.3.3'
  sha256 '15e681f64b7ce3df6f26efebfcf29e918b36841c6053036eb9e1bd993ad97817'
  install 'CLIP STUDIO PAINT.pkg'
  uninstall :files => [
    '/Applications/CLIP STUDIO',
    '/Library/Application Support/CELSYS',
    '#{ENV['HOME']}/Library/Application Support/CELSYS',
    '#{ENV['HOME']}/Library/Caches/jp.co.celsys.CLIPSTUDIO',
    '#{ENV['HOME']}/Library/Caches/jp.co.celsys.InitAnnc'
  ]
end
