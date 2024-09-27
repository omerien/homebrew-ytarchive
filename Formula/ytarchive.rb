class Ytarchive < Formula
  desc 'Archive live and upcoming Youtube.com live streams'
  homepage 'https://github.com/Kethsar/ytarchive'
  url 'https://github.com/Kethsar/ytarchive/archive/refs/tags/v0.5.0.zip'
  version '0.5.0'
  sha256 'd98fa7ac96bdf640768e8752b87c51d609b9a259c17637248f887e1d17933093'
  license 'MIT'
  head 'https://github.com/Kethsar/ytarchive.git', branch: 'dev'

  depends_on 'go' => :build
  depends_on 'ffmpeg' => :optional

  def install
    ENV['CGO_ENABLED'] = '0'
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
  end

  test do
    system bin / 'ytarchive', '--version'
  end
end
