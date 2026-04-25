class MdToGdoc < Formula
  desc "Convert Markdown files to Google Docs with cross-file link rewriting"
  homepage "https://github.com/Studio-1119-Inc/md-to-gdoc"
  url "https://github.com/Studio-1119-Inc/md-to-gdoc/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "5b9cef75886a0a6ec7119bc7f6247bdd5a875718c493b9e53aaf892bd0f18f84"
  license "MIT"

  depends_on "pandoc"

  def install
    bin.install "bin/md-to-gdoc"
    bin.install "bin/reference.docx"
  end

  test do
    assert_match "md-to-gdoc", shell_output("#{bin}/md-to-gdoc --version")
  end
end
