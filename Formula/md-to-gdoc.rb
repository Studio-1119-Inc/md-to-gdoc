class MdToGdoc < Formula
  desc "Convert Markdown files to Google Docs with cross-file link rewriting"
  homepage "https://github.com/Studio-1119-Inc/md-to-gdoc"
  url "https://github.com/Studio-1119-Inc/md-to-gdoc/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "968912e28901957ef5ca200b3f849a212d0cdc53413053d6892e29117d2c506c"
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
