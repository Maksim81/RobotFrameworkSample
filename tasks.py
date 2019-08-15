import pathlib
import shutil

from docutils.core import publish_cmdline
from invoke import task
from selenium import webdriver

assert pathlib.Path.cwd() == pathlib.Path(__file__).parent

@task
def project_docs(ctx):
    """Generate project documentation.

    These docs are visible at http://robotframework.org/WebDemo/.
    """
    args = ['--stylesheet=style.css,extra.css',
            '--link-stylesheet',
            'README.rst',
            'docs/index.html']
    publish_cmdline(writer_name='html5', argv=args)
    print(pathlib.Path(args[-1]).absolute())

@task
def move_docs(ctx):
    """Move report.html and log.html to docs

    These docs are visible http://robotframework.org/WebDemo/.
    """
    log = pathlib.Path('./log.html')
    report = pathlib.Path('./report.html')
    dest = pathlib.Path('.') / 'docs'
    print(log.absolute())
    shutil.copy(log.absolute(), str(dest))
    print(report.absolute())
    shutil.copy(report.absolute(), str(dest))
