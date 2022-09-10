//
//  TimedMetadata.swift
//  TimedMetadataDemo
//
//  Created by Matt Dublin on 8/5/22.
//

import Foundation


let jsonString = """
[
{
  "00:00": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 2
        },
        "playerTwo": {
          "red": 0,
          "blue": 1
        }
      }
    }
  },
  "00:06": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 3
        },
        "playerTwo": {
          "red": 0,
          "blue": 1
        }
      }
    }
  },
  "00:10": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 5
        },
        "playerTwo": {
          "red": 0,
          "blue": 2
        }
      }
    }
  },
  "00:14": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 5
        },
        "playerTwo": {
          "red": 0,
          "blue": 3
        }
      }
    }
  },
  "00:17": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 7
        },
        "playerTwo": {
          "red": 0,
          "blue": 3
        }
      }
    }
  },
  "00:24": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 7
        },
        "playerTwo": {
          "red": 0,
          "blue": 4
        }
      }
    }
  },
  "00:34": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 8
        },
        "playerTwo": {
          "red": 0,
          "blue": 4
        }
      }
    }
  },
  "00:42": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 0,
          "blue": 8
        },
        "playerTwo": {
          "red": 0,
          "blue": 5
        }
      }
    }
  },
  "00:44": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 1,
          "blue": 11
        },
        "playerTwo": {
          "red": 0,
          "blue": 6
        }
      }
    }
  },
  "00:54": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 1,
          "blue": 0
        },
        "playerTwo": {
          "red": 0,
          "blue": 1
        }
      }
    }
  },
  "01:01": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 1,
          "blue": 0
        },
        "playerTwo": {
          "red": 0,
          "blue": 2
        }
      }
    }
  },
  "01:05": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 1,
          "blue": 2
        },
        "playerTwo": {
          "red": 0,
          "blue": 4
        }
      }
    }
  },
  "01:14": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 1,
          "blue": 2
        },
        "playerTwo": {
          "red": 0,
          "blue": 5
        }
      }
    }
  },
  "01:18": {
    "metadata": {
      "scores": {
        "playerOne": {
          "red": 1,
          "blue": 4
        },
        "playerTwo": {
          "red": 0,
          "blue": 5
        }
      }
    }
  }
}
]
"""


struct PlayerData: Decodable {
    let red: String
    let blue: String
}


struct Scores: Decodable {
    let playerOneData: PlayerData
    let playerTwoData: PlayerData
}


struct TimedMetadata: Decodable {
    let scores: Scores
}

struct TimeCode: Decodable {
    let metadata: TimedMetadata
}
