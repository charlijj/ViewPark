
# Unit testing module for the ParkingLot.py and ParkingLotController.py

import unittest
from ParkingLot import ParkingLot
from sql.database import AvailabilityEntry, LotEntry

class TestParkingLot(unittest.TestCase):

    def setUp(self):
        # create a ParkingLot instance to use in tests
        self.lotEntry = LotEntry('Lot A')
        self.posListFileName = 'test_pos_list.pkl' # need to update this file name
        self.parkingLotImage = 'test_parking_lot_image.jpg' 
        self.parkingLot = ParkingLot(self.lotEntry, self.posListFileName, self.parkingLotImage)

    def test_updateFullness(self):
        # test that updateFullness returns an AvailabilityEntry object with correct attributes
        availabilityEntry = self.parkingLot.updateFullness()
        self.assertIsInstance(availabilityEntry, AvailabilityEntry)
        self.assertEqual(availabilityEntry.lotId, self.lotEntry.lotId)
        self.assertGreater(availabilityEntry.timestamp, 0)
        self.assertGreaterEqual(availabilityEntry.fullness, 0)
        self.assertLessEqual(availabilityEntry.fullness, 100)

if __name__ == '__main__':
    unittest.main()

 