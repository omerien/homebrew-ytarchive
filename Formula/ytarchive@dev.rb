class YtarchiveATdev < Formula
  desc 'Archive live and upcoming Youtube.com live streams'
  homepage 'https://github.com/Kethsar/ytarchive'
  url 'https://codeload.github.com/Kethsar/ytarchive/zip/refs/heads/dev'
  version 'fb5b172'
  license 'MIT'
  head 'https://github.com/Kethsar/ytarchive.git', branch: 'dev'

  depends_on 'go' => :build
  depends_on 'ffmpeg' => :optional

  def install
    ENV['CGO_ENABLED'] = '0'
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
  end

  test do
    system bin / 'ytarchive-dev', '--version'
  end
end
