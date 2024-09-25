#ifndef FS_WINGS_H
#define FS_WINGS_H

struct Wing
{
	Wing(uint8_t id, uint16_t clientId, std::string name, bool premium) :
		name(std::move(name)), clientId(clientId), id(id), premium(premium) {}

	std::string name;
	uint16_t clientId;
	uint8_t id;
	bool premium;
};

class Wings
{
	public:
		bool reload();
		bool loadFromXml();
		Wing* getWingByID(uint8_t id);
		Wing* getWingByName(const std::string& name);
		Wing* getWingByClientID(uint16_t clientId);

		const std::vector<Wing>& getWings() const {
			return wings;
		}

	private:
		std::vector<Wing> wings;
};

#endif
