class MdToGdoc < Formula
  desc "Convert Markdown files to Google Docs with cross-file link rewriting"
  homepage "https://github.com/Studio-1119-Inc/md-to-gdoc"
  url "https://github.com/Studio-1119-Inc/md-to-gdoc/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "" # Fill after first release: shasum -a 256 v1.0.0.tar.gz
  license "MIT"

  depends_on "pandoc"

  def install
    bin.install "bin/md-to-gdoc"
  end

  test do
    assert_match "md-to-gdoc", shell_output("#{bin}/md-to-gdoc --version")
  end
end
