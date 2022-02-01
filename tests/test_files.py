import unittest
from gradescope_utils.autograder_utils.decorators import weight
from gradescope_utils.autograder_utils.files import check_submitted_files


class TestFiles(unittest.TestCase):
    @weight(0)
    def test_submitted_files(self):
        """Check submitted files"""
        required_files = check_submitted_files([
            'app.py',
            'dictogram.py',
            'hashtable.py',
            'linkedlist.py',
            'listogram.py',
            'requirements.txt',
            'runtime.txt'
        ])
        for path in required_files:
            print('Missing {0}'.format(path))
        self.assertEqual(len(required_files), 0, 'Missing some required files!')
        print('All required files submitted!')
