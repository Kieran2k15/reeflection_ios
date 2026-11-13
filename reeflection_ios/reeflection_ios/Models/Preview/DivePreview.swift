import Foundation

extension Dive {

    static let preview = try! JSONDecoder().decode([Dive].self, from: Data("""
        [
            {
                "id": "6f1c2a7e-3b9d-4c1e-9a55-0d2b7f4e8a10",
                "start_time_local": "2026-05-11T10:35:00",
                "duration_seconds": 2520,
                "max_depth_m": 31.0,
                "min_temp_c": 29,
                "format": "uddf",
                "filename": "demo-16-2026-05-11-drop-off.uddf",
                "latitude": 4.1148,
                "longitude": 118.6286,
                "samples": [
                    {"t": 0, "depth_m": 0.0, "temp_c": 33.0, "ppo2_bar": 0.21, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 220.0}]},
                    {"t": 60, "depth_m": 14.1, "temp_c": 31.0, "ppo2_bar": 0.51, "ndl_s": 5760, "tank_pressures": [{"ref": "T1", "pressure_bar": 218.0}]},
                    {"t": 120, "depth_m": 28.2, "temp_c": 30.0, "ppo2_bar": 0.8, "ndl_s": 1320, "tank_pressures": [{"ref": "T1", "pressure_bar": 214.1}]},
                    {"t": 180, "depth_m": 29.1, "temp_c": 29.0, "ppo2_bar": 0.82, "ndl_s": 1140, "tank_pressures": [{"ref": "T1", "pressure_bar": 209.1}]},
                    {"t": 240, "depth_m": 30.0, "temp_c": 28.0, "ppo2_bar": 0.82, "ndl_s": 1140, "tank_pressures": [{"ref": "T1", "pressure_bar": 204.1}]},
                    {"t": 300, "depth_m": 30.1, "temp_c": 28.0, "ppo2_bar": 0.82, "ndl_s": 1080, "tank_pressures": [{"ref": "T1", "pressure_bar": 199.1}]},
                    {"t": 360, "depth_m": 30.5, "temp_c": 27.5, "ppo2_bar": 0.83, "ndl_s": 960, "tank_pressures": [{"ref": "T1", "pressure_bar": 194.1}]},
                    {"t": 420, "depth_m": 31, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 960, "tank_pressures": [{"ref": "T1", "pressure_bar": 189.1}]},
                    {"t": 480, "depth_m": 30, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 900, "tank_pressures": [{"ref": "T1", "pressure_bar": 184.2}]},
                    {"t": 540, "depth_m": 29.0, "temp_c": 29.0, "ppo2_bar": 0.82, "ndl_s": 840, "tank_pressures": [{"ref": "T1", "pressure_bar": 179.2}]},
                    {"t": 600, "depth_m": 29.0, "temp_c": 29.0, "ppo2_bar": 0.82, "ndl_s": 780, "tank_pressures": [{"ref": "T1", "pressure_bar": 174.3}]},
                    {"t": 660, "depth_m": 29.0, "temp_c": 29.0, "ppo2_bar": 0.82, "ndl_s": 720, "tank_pressures": [{"ref": "T1", "pressure_bar": 169.3}]},
                    {"t": 720, "depth_m": 28.9, "temp_c": 29.0, "ppo2_bar": 0.82, "ndl_s": 660, "tank_pressures": [{"ref": "T1", "pressure_bar": 164.3}]},
                    {"t": 780, "depth_m": 28.7, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 600, "tank_pressures": [{"ref": "T1", "pressure_bar": 159.3}]},
                    {"t": 840, "depth_m": 28.5, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 540, "tank_pressures": [{"ref": "T1", "pressure_bar": 154.4}]},
                    {"t": 900, "depth_m": 28.2, "temp_c": 29.0, "ppo2_bar": 0.8, "ndl_s": 480, "tank_pressures": [{"ref": "T1", "pressure_bar": 149.5}]},
                    {"t": 960, "depth_m": 28.6, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 420, "tank_pressures": [{"ref": "T1", "pressure_bar": 144.5}]},
                    {"t": 1020, "depth_m": 28.3, "temp_c": 29.0, "ppo2_bar": 0.8, "ndl_s": 360, "tank_pressures": [{"ref": "T1", "pressure_bar": 139.6}]},
                    {"t": 1080, "depth_m": 28.4, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 300, "tank_pressures": [{"ref": "T1", "pressure_bar": 134.7}]},
                    {"t": 1140, "depth_m": 28.7, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 240, "tank_pressures": [{"ref": "T1", "pressure_bar": 129.7}]},
                    {"t": 1200, "depth_m": 28.5, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 180, "tank_pressures": [{"ref": "T1", "pressure_bar": 124.8}]},
                    {"t": 1260, "depth_m": 28.5, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 120, "tank_pressures": [{"ref": "T1", "pressure_bar": 119.9}]},
                    {"t": 1320, "depth_m": 28.3, "temp_c": 29.0, "ppo2_bar": 0.8, "ndl_s": 60, "tank_pressures": [{"ref": "T1", "pressure_bar": 115.0}]},
                    {"t": 1380, "depth_m": 28.6, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 110.0}]},
                    {"t": 1440, "depth_m": 28.6, "temp_c": 29.0, "ppo2_bar": 0.81, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 105.1}]},
                    {"t": 1500, "depth_m": 22.7, "temp_c": 29.0, "ppo2_bar": 0.69, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 100.4}]},
                    {"t": 1560, "depth_m": 18.1, "temp_c": 29.0, "ppo2_bar": 0.59, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 96.6}]},
                    {"t": 1620, "depth_m": 18.2, "temp_c": 29.0, "ppo2_bar": 0.59, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 93.0}]},
                    {"t": 1680, "depth_m": 17.1, "temp_c": 29.0, "ppo2_bar": 0.57, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 89.4}]},
                    {"t": 1740, "depth_m": 11.5, "temp_c": 29.0, "ppo2_bar": 0.45, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 86.2}]},
                    {"t": 1800, "depth_m": 9.0, "temp_c": 30.0, "ppo2_bar": 0.4, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 83.6}]},
                    {"t": 1860, "depth_m": 8.9, "temp_c": 30.0, "ppo2_bar": 0.4, "ndl_s": 0, "tank_pressures": [{"ref": "T1", "pressure_bar": 81.2}]},
                    {"t": 1920, "depth_m": 9.0, "temp_c": 30.0, "ppo2_bar": 0.4, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 78.8}]},
                    {"t": 1980, "depth_m": 6.0, "temp_c": 30.0, "ppo2_bar": 0.34, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 76.4}]},
                    {"t": 2040, "depth_m": 5.1, "temp_c": 30.0, "ppo2_bar": 0.32, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 74.5}]},
                    {"t": 2100, "depth_m": 4.9, "temp_c": 30.0, "ppo2_bar": 0.31, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 72.6}]},
                    {"t": 2160, "depth_m": 4.8, "temp_c": 30.0, "ppo2_bar": 0.31, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 70.7}]},
                    {"t": 2220, "depth_m": 4.9, "temp_c": 30.0, "ppo2_bar": 0.31, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 68.8}]},
                    {"t": 2280, "depth_m": 3.5, "temp_c": 30.0, "ppo2_bar": 0.28, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 66.9}]},
                    {"t": 2340, "depth_m": 3.7, "temp_c": 30.0, "ppo2_bar": 0.29, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 65.2}]},
                    {"t": 2400, "depth_m": 3.6, "temp_c": 30.0, "ppo2_bar": 0.29, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 63.4}]},
                    {"t": 2460, "depth_m": 2.9, "temp_c": 30.0, "ppo2_bar": 0.27, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 61.7}]},
                    {"t": 2520, "depth_m": 0.0, "temp_c": 30.0, "ppo2_bar": 0.21, "ndl_s": 5940, "tank_pressures": [{"ref": "T1", "pressure_bar": 60.2}]}
                ]
            },
            {
                "id": "1d4e8b2a-7c3f-4a9e-b6d1-5e2f9c8a3b74",
                "start_time_local": "2026-03-18T09:15:00",
                "duration_seconds": 1980,
                "max_depth_m": 43.0,
                "min_temp_c": 22,
                "format": "uddf",
                "filename": "demo-11-2026-03-18-blue-hole.uddf",
                "latitude": 28.5722,
                "longitude": 34.5371
            }
        ]
        """.utf8))
}
