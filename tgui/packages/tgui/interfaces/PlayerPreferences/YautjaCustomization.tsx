import { useBackend } from '../../backend';
import { Section, Flex, LabeledList, Box } from '../../components';
import { TextFieldPreference } from './FieldPreferences';
import { ProfilePicture } from './ProfilePicture';

export const YautjaCustomization = (props, context) => {
  const { data } = useBackend<YautjaCustomizationData>(context);
  const {
    has_wl,
    predator_name,
    predator_gender,
    predator_age,
    predator_h_style,
    predator_skin_color,
    predator_translator_type,
    predator_mask_type,
    predator_armor_type,
    predator_boot_type,
    predator_armor_material,
    predator_mask_material,
    predator_greave_material,
    predator_caster_material,
    predator_cape_type,
    predator_cape_color,
    predator_flavor_text,
    yautja_status,
  } = data;

  return has_wl ? (
    <>
      <Section title="Yautja Information">
        <Flex>
          <Flex.Item>
            <LabeledList>
              <TextFieldPreference
                label={'Yautja Name'}
                value={predator_name}
                action={'predator_name'}
              />
              <TextFieldPreference
                label={'Yautja Gender'}
                value={predator_gender}
                action={'predator_gender'}
              />
              <TextFieldPreference
                label={'Yautja Age'}
                value={predator_age}
                action={'predator_age'}
              />
              <TextFieldPreference
                label={'Yautja Quill Style'}
                value={predator_h_style}
                action={'predator_h_style'}
              />
              <TextFieldPreference
                label={'Yautja Skin Color'}
                value={predator_skin_color}
                action={'predator_skin_color'}
              />
              <TextFieldPreference
                label={'Yautja Flavor Text'}
                value={predator_flavor_text}
                action={'predator_flavor_text'}
              />
              <TextFieldPreference
                label={'Yautja Whitelist Status'}
                value={yautja_status}
                action={'yautja_status'}
              />
            </LabeledList>
          </Flex.Item>
          <Flex.Item>
            <ProfilePicture />
          </Flex.Item>
        </Flex>
      </Section>
      <Section title="Equipment Setup">
        <Flex>
          <Flex.Item>
            <LabeledList>
              <TextFieldPreference
                label={'Translator Type'}
                value={predator_translator_type}
                action={'predator_translator_type'}
              />
              <TextFieldPreference
                label={'Mask Style'}
                value={predator_mask_type}
                action={'predator_mask_type'}
              />
              <TextFieldPreference
                label={'Armor Style'}
                value={predator_armor_type}
                action={'predator_armor_type'}
              />
              <TextFieldPreference
                label={'Greave Style'}
                value={predator_boot_type}
                action={'predator_boot_type'}
              />
              <TextFieldPreference
                label={'Mask Material'}
                value={predator_mask_material}
                action={'predator_mask_material'}
              />
              <TextFieldPreference
                label={'Armor Material'}
                value={predator_armor_material}
                action={'predator_armor_material'}
              />
              <TextFieldPreference
                label={'Greave Material'}
                value={predator_greave_material}
                action={'predator_greave_material'}
              />
              <TextFieldPreference
                label={'Caster Material'}
                value={predator_caster_material}
                action={'predator_caster_material'}
              />
            </LabeledList>
          </Flex.Item>
        </Flex>
      </Section>
      <Section title="Clothing Setup">
        <Flex>
          <Flex.Item>
            <LabeledList>
              <TextFieldPreference
                label={'Cape Type'}
                value={predator_cape_type}
                action={'predator_cape_type'}
              />
              <TextFieldPreference
                label={'Cape Color'}
                value={predator_cape_color}
                action={'predator_cape_color'}
              />
            </LabeledList>
          </Flex.Item>
        </Flex>
      </Section>
    </>
  ) : (
    <Box>WL requered</Box>
  );
};
