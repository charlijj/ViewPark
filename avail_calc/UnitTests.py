
# Unit testing module for the ParkingLot.py and ParkingLotController.py

import unittest
from ParkingLot import ParkingLot
from sql.database import AvailabilityEntry, LotEntry

class TestParkingLot(unittest.TestCase):
      
    def setUp(self):
 
        # ParkingLot instance to use in tests
        self.lot_entry = LotEntry('Lot A')
        self.pos_list_file_name = f'./img/lotA/posList'
        self.lot_image = f'./img/lotA/lotA1.jpg'
        self.parking_lot = ParkingLot(self.lot_entry, self.pos_list_file_name, self.lot_image)

    def test_updateFullness(self):

        # test that updateFullness returns an AvailabilityEntry object with correct attributes
        availability_entry = self.parking_lot.updateFullness()

        # check that availability_entry is an instance of AvailabilityEntry.
        self.assertIsInstance(availability_entry, AvailabilityEntry)

        # check that the lotId attribute of availability_entry is equal to the lotId attribute of self.lot_entry.
        self.assertEqual(availability_entry.lotId, self.lot_entry.lotId)

        # check that the fullness attribute of availability_entry is greater than or equal to 0.
        self.assertGreaterEqual(availability_entry.fullness, 0)

        # check that the fullness attribute of availability_entry is less than or equal to 100.
        self.assertLessEqual(availability_entry.fullness, 100)

if __name__ == '__main__':
    unittest.main()