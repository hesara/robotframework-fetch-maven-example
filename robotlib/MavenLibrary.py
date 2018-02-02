import os
import sys

# pip install maven-artifact
from maven.downloader import Downloader
from maven.artifact import Artifact

class MavenLibrary(object):

    # TODO cache? (hash of artifact name unless -SNAPSHOT)

    def fetch_maven_artifact(self, mavenid, filename, baseurl='https://repo1.maven.org/maven2', username='', port=''):
        cwd = os.getcwd()
        dl = Downloader(baseurl, username, port)
        artifact = Artifact.parse(mavenid)
        if not dl.download(artifact, cwd + '/' + filename):
            raise Exception('Failed to download maven artifact ' + mavenid)
