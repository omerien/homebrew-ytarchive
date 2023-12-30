class YtarchiveDev < Formula
  desc 'Archive live and upcoming Youtube.com live streams'
  homepage 'https://github.com/Kethsar/ytarchive'
  url 'https://codeload.github.com/Kethsar/ytarchive/zip/refs/heads/dev'
  version '5d91faa'
  sha256 '7732513b95c83c6baa740a893731309c979e21f311af37edd51d2c2c2c9dff51' 
  license 'MIT'
  head 'https://github.com/Kethsar/ytarchive.git', branch: 'dev'

  depends_on 'go' => :build
  depends_on 'ffmpeg'

  def install
    ENV['CGO_ENABLED'] = '0'
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
  end

  test do
    system bin / 'ytarchive-dev', '--version'
  end
end
