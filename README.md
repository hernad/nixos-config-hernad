# Start


## Notes

   nix flake init -t github:misterio77/nix-starter-config#standard

 
lenovo16 configuration.nix

   services.pcscd.enable = true;
   programs.gnupg.agent = {
      enable = true;
      pinentryFlavor = "curses";
      enableSSHSupport = true;
   };


   gpg --full-generate-key

      gpg: revocation certificate stored as '/home/hernad/.gnupg/openpgp-revocs.d/453454CDE1C7FE12A2995CAC85669FDDE2456A79.rev'
      public and secret key created and signed.

      pub   ed25519 2023-06-02 [SC]
            453454CDE1C7FE12A2995CAC85669FDDE2456A79
      uid                      Ernad Husremovic (bring.out doo Sarajevo) <hernad@bring.out.ba>
      sub   cv25519 2023-06-02 [E]


   
    gpg --keyring secring.gpg --export-secret-keys 453454CDE1C7FE12A2995CAC85669FDDE2456A79 > ~/.gnupg/secring.gpg



   systemctl --user restart gpg-agent


   age-keygen -o ~/.config/sops/age/keys.txt
   Public key: age1y26hj2vaf8tk2sv3hpl4fg6c8s6g9ccnhuu09vchh4hu3ytkvews3jpq0v




sops password file

   nix-shell -p sops --run "sops secrets/age.yaml"


   nix-shell -p sops age --run "sops -e -d secrets/age.yaml"
   hello: test
   example_key: value1



