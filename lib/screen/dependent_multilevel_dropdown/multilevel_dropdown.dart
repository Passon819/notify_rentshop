import 'package:flutter/material.dart';
import 'province_district_subdistrict.dart';

class MultiDropdown extends StatefulWidget {
  const MultiDropdown({super.key});

  @override
  State<MultiDropdown> createState() => _MultiDropdownState();
}

class _MultiDropdownState extends State<MultiDropdown> {
  String? _selectedProvine;
  // var provine = {"ChiangMai": "CMI", "ChiangRai": "CRI", "Bangkok": "BKK"};
  List _provines = [];
  provineDependentDropdown() {
    provine.forEach((key, value) {
      _provines.add(key);
    });
  }

  String? _selectedDistrict;
  // var district = {
  //   "Chaiprakan": "CMI",
  //   "Fang": "CMI",
  //   "MeaSai": "CRI",
  //   "Phan": "CRI",
  //   "BangNa": "BKK",
  //   "BangRuk": "BKK",
  //   "Sathon": "BKK"
  // };
  List _districts = [];
  districtDependentDropdown(provinceShortName) {
    district.forEach((key, value) {
      if (provinceShortName == value) {
        _districts.add(key);
      }
    });
    //_selectedDistrict = _districts[0];
    _selectedDistrict = null;
  }

  String? _selectedSubDistrict;
  // var subdistrict = {
  //   "Nongbua": "Chaiprakan",
  //   "Meatarob": "Chaiprakan",
  //   "Sansai": "Fang",
  //   "Meaka": "Fang",
  //   "Bandai": "MeaSai",
  //   "Doingam": "Phan",
  //   "Saikauw": "Phan",
  //   "Meaungphan": "Phan",
  //   "BangNa": "BangNa",
  //   "Seerom": "BangRuk",
  //   "Yannawa": "Sathon"
  // };
  List _subdistricts = [];
  subdistrictDependentDropdown(ditrictShortName) {
    subdistrict.forEach((key, value) {
      if (ditrictShortName == value) {
        _subdistricts.add(key);
      }
    });
    //_selectedSubDistrict = _subdistricts[0];
    _selectedSubDistrict = null;
  }

  @override
  void initState() {
    super.initState();
    provineDependentDropdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dependent Multilevel Dropdown'),
      ),
      body: Center(
        child: Column(
          children: [
            //Province
            const SizedBox(height: 20),
            const Text("Province"),
            DropdownButton(
              items: _provines.map((provine) {
                return DropdownMenuItem(
                  value: provine,
                  child: Text('$provine'),
                );
              }).toList(),
              onChanged: (newValue) {
                _districts = [];
                _subdistricts = [];
                districtDependentDropdown(provine[newValue]);
                setState(() {
                  _selectedProvine = "$newValue";
                });
              },
              value: _selectedProvine,
              menuMaxHeight: 400,
              hint: Text('เลือกจังหวัด'),
            ),
            //District
            const SizedBox(height: 20),
            const Text("District"),
            DropdownButton(
              items: _districts.map((distirct) {
                return DropdownMenuItem(
                  value: distirct,
                  child: Text('$distirct'),
                );
              }).toList(),
              onChanged: (newValue) {
                print(newValue);
                _subdistricts = [];
                subdistrictDependentDropdown(newValue);
                setState(() {
                  _selectedDistrict = "$newValue";
                });
              },
              value: _selectedDistrict,
              menuMaxHeight: 400,
              hint: Text(
                'เลือกอำเภอ',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            //SubDistrict
            const SizedBox(height: 20),
            const Text("SubDistrict"),
            DropdownButton(
              items: _subdistricts.map((subdistirct) {
                return DropdownMenuItem(
                  value: subdistirct,
                  child: Text('$subdistirct'),
                );
              }).toList(),
              onChanged: (newValue) {
                print(newValue);
                setState(() {
                  _selectedSubDistrict = "$newValue";
                });
              },
              value: _selectedSubDistrict,
              menuMaxHeight: 400,
              hint: Text(
                'เลือกตำบล',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
