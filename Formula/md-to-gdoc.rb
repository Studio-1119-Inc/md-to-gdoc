class MdToGdoc < Formula
  desc "Convert Markdown files to Google Docs with cross-file link rewriting"
  homepage "https://github.com/Studio-1119-Inc/md-to-gdoc"
  url "https://github.com/Studio-1119-Inc/md-to-gdoc/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b973c8f37cd0589c05e2d26add66175d984a5ac0ffc31d31b75d1b889bc64891"
  license "MIT"

  depends_on "pandoc"

  def install
    bin.install "bin/md-to-gdoc"
  end

  test do
    assert_match "md-to-gdoc", shell_output("#{bin}/md-to-gdoc --version")
  end
end
