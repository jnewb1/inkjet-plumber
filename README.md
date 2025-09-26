# Inkjet Plumber for Docker

Prevent inkjet printers from drying out with weekly prints

## Environment Variables:

| Variable Name | Description | Example Value | Required / Default Value |
|---|---|---|---|
| `PRINTER_URL` | Printer URL for CUPS | `ipp://$PRINTER_IP/ipp/print` | Yes |
| `PRINTER_MODEL` | Printer PPD file. Defaults to using `everywhere` driver | `everywhere` or `/path/to/driver.ppd` | "everywhere" |
