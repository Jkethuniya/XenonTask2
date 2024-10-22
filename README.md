# XenonTask2

# sysopctl - System Operations Control Command

**Command Name:** sysopctl  
**Command Version:** v0.1.0  

## Overview
`sysopctl` is a Bash script designed to manage system services, processes, and overall system health. This command enhances system administration capabilities by providing easy access to essential system operations.


## Command Specifications

 **Manual Page:**
  - Create a detailed manual page for `sysopctl` so users can access full documentation using `man sysopctl`.
    ![List All Service list](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729610795/WhatsApp_Image_2024-10-22_at_20.56.03_qodamm.jpg)


- **Help Option:**
  - Implement a `--help` option that outlines usage and examples, akin to `sysopctl --help`.
  ![List All Service list](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609796/WhatsApp_Image_2024-10-22_at_19.16.34_od2voi.jpg)

- **Version Information:**
  - Users should be able to view the command version with: `sysopctl --version`.
  ![List All Service list](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609795/WhatsApp_Image_2024-10-22_at_19.17.32_zg3tmp.jpg)



<!-- #### Part 1 | Level Easy -->

- **List Running Services:**
- sysopctl service list - Lists all active services currently running on the system.
  - **Command:** `$ sysopctl service list`
  ![List All Service list](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609795/WhatsApp_Image_2024-10-22_at_19.32.08_awalmn.jpg)
  <!-- - **Expected Output:** List of all active services, similar to `systemctl list-units --type=service`. -->

- **View System Load:**
- sysopctl system load - Displays the current system load averages.
  - **Command:** `$ sysopctl system load`
  ![Current system load averages](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609795/WhatsApp_Image_2024-10-22_at_19.20.24_cofpeb.jpg)
  <!-- - **Expected Output:** Current system load averages, akin to the output from the `uptime` command. -->

<!-- #### Part 2 | Level Intermediate -->

- **Manage System Services:**
  - **Start a service:** `$ sysopctl service start <service-name>`
  - sysopctl service start <service-name> - Initiates the specified service on the system.
    ![Service Name](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609794/WhatsApp_Image_2024-10-22_at_19.38.08_wmbert.jpg)


  - **Stop a service:** `$ sysopctl service stop <service-name>`
  - sysopctl service stop <service-name> - Stops the specified service currently running on the system.
    ![Service Name](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609794/WhatsApp_Image_2024-10-22_at_19.38.53_ocl2vh.jpg)
  <!-- - **Expected Output:** Status updates confirming the start or stop of services, similar to `systemctl start/stop`. -->

- **Check Disk Usage:**
- sysopctl disk usage - Shows disk usage statistics for each partition.
  - **Command:** `$ sysopctl disk usage`
  ![Service Name](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609795/WhatsApp_Image_2024-10-22_at_19.19.39_ewsg2t.jpg)
  <!-- - **Expected Output:** Disk usage statistics by partition, similar to `df -h`. -->



- **Monitor System Processes:**
- sysopctl process monitor - Monitors and displays real-time process activity.
  - **Command:** `$ sysopctl process monitor`
    ![Service Name](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609795/WhatsApp_Image_2024-10-22_at_19.21.37_pnyk8s.jpg)
  <!-- - **Expected Output:** Real-time process activity, akin to `top` or `htop`. -->


- **Backup System Files:**
- sysopctl backup <path> - Initiates a backup of files from the specified path.
  - **Command:** `$ sysopctl backup <path>`
  ![Service Name](https://res.cloudinary.com/dzqcqce5x/image/upload/v1729609794/WhatsApp_Image_2024-10-22_at_19.53.38_vdnyyg.jpg)
  <!-- - **Expected Output:** Confirmation of backup initiation and status, potentially using `rsync` for file transfers. -->
