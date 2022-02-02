import unittest
from gradescope_utils.autograder_utils.decorators import weight
from gradescope_utils.autograder_utils.files import check_submitted_files


class TestFiles(unittest.TestCase):
    """Worth 10 points in Gradescope."""

    @weight(10.0)
    def test_submitted_files(self):
        """Make sure we have everything we need to run the Tweet Generator project."""

        required_files = check_submitted_files([
            'data/corpus.txt',
            'data/sample.txt',
            'app.py',
            'dictogram.py',
            'hashtable.py',
            'linkedlist.py',
            'listogram.py',
            'requirements.txt',
            'runtime.txt',
            'Procfile'
        ])

        # output = """
        # Your solution must contain the following files.
        # Here's an example of the repository structure we set up in class.

        # 📂 ACS-1120-Intro-Data-Structures   <- SUBMIT THIS FOLDER!
        #     ├── 📂 Code                     <- DO NOT SUBMIT!
        #         ├── 📂 data
        #             └── sample.txt          <- A few paragraphs of your corpus.
        #         ├── app.py
        #         ├── dictogram.py
        #         ├── hashtable.py
        #         ├── linkedlist.py
        #         ├── listogram.py
        #         ├── requirements.txt
        #         ├── runtime.txt
        #         └── Procfile
        # """

        error = f'[ERROR]: {0}'.format(', '.join(required_files))
        self.assertEqual(len(required_files), 0,
                         f'Missing some required files: {error}')
