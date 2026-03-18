class MdToGdoc < Formula
  desc "Convert Markdown files to Google Docs with cross-file link rewriting"
  homepage "https://github.com/Studio-1119-Inc/md-to-gdoc"
  url "https://github.com/Studio-1119-Inc/md-to-gdoc/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "906ce5eccc0c40e64f0aaf457dbdc91613e51d4246f9b07907e21174a92b565b"
  license "MIT"

  depends_on "pandoc"

  def install
    bin.install "bin/md-to-gdoc"
  end

  test do
    assert_match "md-to-gdoc", shell_output("#{bin}/md-to-gdoc --version")
  end
end
