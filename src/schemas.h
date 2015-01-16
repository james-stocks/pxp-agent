#ifndef SRC_AGENT_SCHEMAS_H_
#define SRC_AGENT_SCHEMAS_H_

#include <rapidjson/document.h>
#include <valijson/schema.hpp>

namespace Cthun {
namespace Agent {

class Schemas {
  public:
    static bool validate(const rapidjson::Value& document,
                         const valijson::Schema& schema,
                         std::vector<std::string> &errors);
    static valijson::Schema external_action_metadata();
    static valijson::Schema network_message();
    static valijson::Schema cnc_data();
};

}  // namespace Agent
}  // namespace Cthun

#endif  // SRC_AGENT_SCHEMAS_H_