class YtarchiveDev < Formula
  desc 'Archive live and upcoming Youtube.com live streams'
  homepage 'https://github.com/Kethsar/ytarchive'
  url 'https://github.com/Kethsar/ytarchive/archive/refs/tags/latest.zip'
  version '5d91faa'
  sha256 'aaaa94fe0fec98e9f6324c56d8b8475e9035cf93931f511361cefa6f795a8375' 
  license 'MIT'
  head 'https://github.com/Kethsar/ytarchive.git', branch: 'dev'
  conflicts_with "omerien/ytarchive/ytarchive", because: "both have a ytarchive binary"

  depends_on 'go' => :build
  depends_on 'ffmpeg'

  def install
    ENV['CGO_ENABLED'] = '0'
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
  end

  test do
    system bin / 'ytarchive', '--version'
  end
end
