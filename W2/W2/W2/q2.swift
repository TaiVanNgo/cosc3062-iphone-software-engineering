//
//  q2.swift
//  W2
//
//  Created by Van Tai on 7/7/26.
//
func Q2(){
    var funFactsRMIT: [String: Int] = [
        "numberOfStudents" : 12000,
        "numberScholarships": 1900,
        "numberOfGraduates": 20500,
        "numberMasterPrograms": 100,
        "numberPhDPrograms": 3,
        "numberStudentClubs": 50,
        "QSWorldRanking": 150,
    ]
    
    //Update some data
    funFactsRMIT["numberOfGraduates"] = 25500
    funFactsRMIT["numberStudentClubs"] = 60
    funFactsRMIT["QSWorldRanking"] = 123
    funFactsRMIT["yearFounded"] = 1887
    funFactsRMIT["numberOfStaffs"] = 12000
    
    print("Here are some fun facts of RMIT:")
//    for (k,v) in funFactsRMIT{
//        print("The \(k): \(v)")
//    }

    print("The Number Of Students: \(funFactsRMIT["numberOfStudents"]!)")
    print("The Number Scholarships: \(funFactsRMIT["numberScholarships"]!)")
    print("The Number Of Graduates: \(funFactsRMIT["numberOfGraduates"]!)")
    print("The Number Master Programs: \(funFactsRMIT["numberMasterPrograms"]!)")
    print("The Number Phd Programs: \(funFactsRMIT["numberPhDPrograms"]!)")
    print("The Number Student Clubs: \(funFactsRMIT["numberStudentClubs"]!)")
    print("The Qs World Ranking: \(funFactsRMIT["QSWorldRanking"]!)")
    print("The Year Founded: \(funFactsRMIT["yearFounded"]!)")
    print("The Number Of Staffs: \(funFactsRMIT["numberOfStaffs"]!)")
    
    print("There are \(funFactsRMIT.count) factsin our fun facts dictionary about RMIT!")
}
