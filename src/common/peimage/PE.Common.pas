unit PE.Common;

interface

{$MINENUMSIZE 4}

{ Base types }

type
  Int8 = ShortInt;
  Int16 = SmallInt;
  Int32 = Integer;
  IntPtr = NativeInt;
  UInt8 = Byte;
  UInt16 = Word;
  UInt32 = Cardinal;

  Dword = UInt32;
  PDword = ^Dword;

  TVA = UInt64;
  TRVA = UInt64;

  PInt8 = ^Int8;
  PInt16 = ^Int16;
  PInt32 = ^Int32;
  PInt64 = ^Int64;

  PUInt8 = ^UInt8;
  PUInt16 = ^UInt16;
  PUInt32 = ^UInt32;
  PUInt64 = ^UInt64;

  TFileOffset = type UInt64;

  TParserFlag = (
    PF_EXPORT,
    PF_IMPORT,
    PF_IMPORT_DELAYED,
    PF_RELOCS,
    PF_TLS,
    PF_RESOURCES
    );

  TParserFlags = set of TParserFlag;

  TPEImageObject = TObject; // Meant to cast TObject -> TPEImage

  TParserOption = (
    // If section vsize is 0 try to use rsize instead.
    PO_SECTION_VSIZE_FALLBACK,
    // Rename invalid section name.
    PO_SECTION_AUTORENAME_INVALID
    );

  TParserOptions = set of TParserOption;

const
  SUSPICIOUS_MIN_LIMIT_EXPORTS = $10000;
  DEFAULT_SECTOR_SIZE          = 512;
  DEFAULT_PAGE_SIZE            = 4096;

  ALL_PARSER_FLAGS = [PF_EXPORT, PF_IMPORT, PF_IMPORT_DELAYED, PF_RELOCS,
    PF_TLS, PF_RESOURCES];

  DEFAULT_PARSER_FLAGS = ALL_PARSER_FLAGS;
  DEFAULT_OPTIONS      = [PO_SECTION_VSIZE_FALLBACK, PO_SECTION_AUTORENAME_INVALID];

  // Data directories.
  DDIR_EXPORT           = 0;
  DDIR_IMPORT           = 1;
  DDIR_RESOURCE         = 2;
  DDIR_EXCEPTION        = 3;
  DDIR_CERTIFICATE      = 4;
  DDIR_RELOCATION       = 5;
  DDIR_DEBUG            = 6;
  DDIR_ARCHITECTURE     = 7;
  DDIR_GLOBALPTR        = 8;
  DDIR_TLS              = 9;
  DDIR_LOADCONFIG       = 10;
  DDIR_BOUNDIMPORT      = 11;
  DDIR_IAT              = 12;
  DDIR_DELAYIMPORT      = 13;
  DDIR_CLRRUNTIMEHEADER = 14;

  DDIR_LAST = 14;

type
  TParserResult = (PR_OK, PR_ERROR, PR_SUSPICIOUS);

  { Overlay }

type
  TOverlay = packed record
    Offset: TFileOffset;
    Size: UInt64;
  end;

  POverlay = ^TOverlay;

{$SCOPEDENUMS ON}
  TEndianness = (Little, Big);
{$SCOPEDENUMS OFF}


implementation

end.
