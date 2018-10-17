//
//  Should_I_Eat_HereTests.swift
//  Should I Eat HereTests
//
//  Created by Ben Bueltmann on 10/17/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import XCTest
@testable import Should_I_Eat_Here

class Should_I_Eat_HereTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecodableRestaurants() {
        
        let json =
        """
        {":@computed_region_43wa_7qmu":"18",":@computed_region_6mkv_f3dw":"21849",":@computed_region_awaf_s7ux":"13",":@computed_region_bdys_3d7i":"667",":@computed_region_vrxf_vc4k":"6","address":"4533-4535 N LINCOLN AVE ","aka_name":"THE  WARBLER","city":"CHICAGO","dba_name":"THE WARBLER CHICAGO","facility_type":"Restaurant","inspection_date":"2018-10-16T00:00:00.000","inspection_id":"2229727","inspection_type":"Canvass","latitude":"41.96412222254028","license_":"2549461","location":{"type":"Point","coordinates":[-87.685445881528,41.96412222254]},"longitude":"-87.68544588152808","results":"Pass w/ Conditions","risk":"Risk 1 (High)","state":"IL","violations":"10. ADEQUATE HANDWASHING SINKS PROPERLY SUPPLIED AND ACCESSIBLE - Comments: 5-202.12(A)- NO HAND SINK IN THE WAIT STATION/COFFEE STATION. INSTRUCTED TO INSTALL WITH HOT AND COLD RUNNING WATER UNDER CITY PRESSURE AND PROVIDE PAPER TOWEL AND HAND SOAP.  PRIORITY FOUNDATION  7-38-030(C) NO CITATION ISSUED.   | 55. PHYSICAL FACILITIES INSTALLED, MAINTAINED & CLEAN - Comments: 6-201.11- MUST CLEAN THE FLOOR INSIDE THE WATER HEATER ROOM AND THE CLEAN PLATE ROOM AND MAINTAIN.  PEELING PAINT ON THE WALLS IN THE HALLWAY KITCHEN. MUST SCRAPE PEELING PAINT AND REPAINT.   6-201.16- BRICK WALLS IN THE BASEMENT PREP AREA. MUST SEALED THE BRICK WALL. MAKE IT SMOOTH EASILY CLEANABLE AND MAINTAIN.","zip":"60625"}
        """
        
        if let data = json.data(using: .utf8) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let _ = try decoder.decode(Restaurant.self, from: data)
            } catch {
                print(error)
                XCTFail()
            }
        }
    }
}
