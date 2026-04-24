class MdToGdoc < Formula
  desc "Convert Markdown files to Google Docs with cross-file link rewriting"
  homepage "https://github.com/Studio-1119-Inc/md-to-gdoc"
  url "https://github.com/Studio-1119-Inc/md-to-gdoc/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "a9bffd489854e6f54f55ed467946a7106b9cc1e42aca88f6d4c6c9042319d95f"
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
