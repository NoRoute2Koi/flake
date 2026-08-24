{
  boot.initrd.luks.devices."data".device = "/dev/disk/by-uuid/c7a96496-0cc8-4a9e-b6f6-6f28e2e12233";
  fileSystems = {
    "/boot" = {
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
      device = "/dev/disk/by-id/ata-XrayDisk_240GB_AA000000000000003111-part1";
    };
    "/" = {
      fsType = "ext4";
      options = [ "noatime" ];
      device = "/dev/disk/by-id/ata-XrayDisk_240GB_AA000000000000003111-part2";
    };
    "/mnt/data" = {
      fsType = "btrfs";
      options = [ "compress=zstd:4" "noatime" "nofail" ];
      device = "/dev/disk/by-uuid/facf728c-d0fe-4f98-9973-de951979e7d1";
    };
  };
}
